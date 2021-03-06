/*
 This file is part of SWGANH. For more information, visit http://swganh.com
 
 Copyright (c) 2006 - 2011 The SWG:ANH Team

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include "anh/network/soe/filters/compression_filter.h"

#include <vector>

#include <glog/logging.h>
#include <zlib.h>

#include "anh/network/soe/packet.h"
#include "anh/network/soe/session.h"

using namespace anh;
using namespace network::soe;
using namespace filters;
using namespace std;

shared_ptr<Packet> CompressionFilter::operator()(shared_ptr<Packet> packet) const {
    auto message = packet->message();

    try {
        if(message->size() > packet->session()->receive_buffer_size() - 20) {
            Compress_(*message);

            message->write<uint8_t>(1); // compressed
        } else {        
            message->write<uint8_t>(0); // not compressed
        }
    } catch(...) {
        DLOG(WARNING) << "Unable to compress outgoing message \n\n" << *message;
    }

    return packet;
}

void CompressionFilter::Compress_(ByteBuffer& buffer) const {
    vector<uint8_t>& packet_data = buffer.raw();
    uint32_t packet_size = buffer.size();
    uint32_t compressed_size = 0;

    // Determine the offset to begin compressing data at
    uint16_t offset = (packet_data[0] == 0x00) ? 2 : 1;
    
    z_stream zstream_;

    zstream_.zalloc = Z_NULL;
    zstream_.zfree = Z_NULL;
    zstream_.opaque = Z_NULL;
    zstream_.avail_in = Z_NULL;
    zstream_.next_in = Z_NULL;

    deflateInit(&zstream_, Z_DEFAULT_COMPRESSION);

    vector<uint8_t> compression_output(packet_size);

    zstream_.next_in = reinterpret_cast<Bytef *>(&packet_data[offset]);
    zstream_.avail_in = packet_size - offset;
    zstream_.next_out = reinterpret_cast<Bytef *>(&compression_output[0]);
    zstream_.avail_out = packet_size;

    deflate(&zstream_, Z_FINISH);

    ByteBuffer compressed(&packet_data[0], offset);
    compressed.write(&compression_output[0], zstream_.total_out);
    
    deflateEnd(&zstream_);

    buffer.swap(compressed);
}

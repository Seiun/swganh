#ifndef SORTED_CONTAINER_H
#define SORTED_CONTAINER_H

#include "container_component_interface.h"
#include <boost/thread/shared_mutex.hpp>

namespace swganh
{
namespace containers
{

class sorted_container_component : public swganh::containers::ContainerComponentInterface, public std::enable_shared_from_this<sorted_container_component>
{
public:
	sorted_container_component(anh::component::ComponentType type = anh::component::ComponentType("Sorted"))
		: ContainerComponentInterface(type)
		, is_populated_(false) {}

	//View Methods
	virtual bool has_entity(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what);
	virtual bool contained_objects(std::shared_ptr<anh::component::Entity> who, bool causes_populate,std::function<void(std::shared_ptr<anh::component::Entity>, std::shared_ptr<anh::component::Entity>)> funct, size_t max_depth=0, bool top_down=true);
	virtual std::shared_ptr<anh::component::Entity> entity_in_slot(std::shared_ptr<anh::component::Entity> who,std::string slot_name) { return nullptr; }

	//Modification Methods
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_insertion);
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, unsigned int id, bool force_insertion) { return false; }
	virtual bool remove(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_removal);
	virtual bool transfer_to(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, std::shared_ptr<swganh::containers::ContainerComponentInterface> recv_container, bool force_insertion, bool for_removal);
	
	//Notification Methods
	virtual void make_aware(std::shared_ptr<anh::component::Entity> what);

	virtual void state_update(std::shared_ptr<anh::component::Entity> what, const glm::vec3& oldpos, const glm::vec3& newpos, const glm::quat& rot);

	virtual void make_unaware(std::shared_ptr<anh::component::Entity> what);
	virtual std::set<std::shared_ptr<anh::component::Entity>> aware_entities(std::shared_ptr<anh::component::Entity> caller_hint);

	//Size/Capacity Methods
	virtual bool empty();
	virtual bool full();

	virtual size_t size();
	virtual size_t capacity();
	virtual bool capacity(size_t new_capacity);

	virtual bool collect_garbage() {return true; /*@todo fix me*/ }
	virtual bool is_populated() { return true; /*@todo fix me*/ }
	virtual void persist() {}
	virtual void populate() {}

	virtual bool intrl_insert_(std::shared_ptr<anh::component::Entity> what, std::shared_ptr<ContainerComponentInterface> old_container);

protected:
	boost::shared_mutex intrl_lock_;
	bool is_populated_;

	std::set<std::shared_ptr<anh::component::Entity>> aware_entities_;
	std::set<std::shared_ptr<anh::component::Entity>> contained_objects_;
};
};
};


#endif
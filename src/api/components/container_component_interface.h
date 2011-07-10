#ifndef CONTAINER_COMPONENT_INTERFACE_H
#define CONTAINER_COMPONENT_INTERFACE_H

#include <api/container_permissions_interface.h>
#include <anh/component/component_interface.h>
#include <anh/component/base_component.h>
#include <memory>
#include <glm/glm.hpp>
#include <functional>

namespace anh
{
namespace api
{
namespace components
{
class NullContainerComponent;
class ContainerComponentInterface : public anh::component::BaseComponent
{
public:
	ContainerComponentInterface(const anh::component::ComponentType& type)
		: BaseComponent(anh::component::ComponentType("Container"), type) {}

	//View Methods
	virtual bool has_entity(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) = 0;
	virtual bool contained_objects(std::shared_ptr<anh::component::Entity> who, std::function<void(std::shared_ptr<anh::component::Entity>, std::shared_ptr<anh::component::Entity>)> funct, size_t max_depth=0, bool top_down=true) = 0;
	virtual std::shared_ptr<anh::component::Entity> entity_in_slot(std::shared_ptr<anh::component::Entity> who,std::string slot_name) = 0;

	//Modification Methods
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_insertion) = 0;
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, unsigned int id, bool force_insertion) = 0;
	virtual bool remove(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_removal) = 0;
	virtual bool transfer_to(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, std::shared_ptr<ContainerComponentInterface> recv_container, bool force_insertion, bool force_removal) = 0;

	//Awareness Methods
	virtual void make_aware(std::shared_ptr<anh::component::Entity> what) = 0;
	virtual void state_update(std::shared_ptr<anh::component::Entity> what, glm::vec3& old) = 0;
	virtual void make_unaware(std::shared_ptr<anh::component::Entity> what) = 0;
	virtual std::set<std::shared_ptr<anh::component::Entity>> aware_entities(std::shared_ptr<anh::component::Entity> caller_hint) = 0;

	//Permission Methods
	virtual bool permissions_can_view(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_can_insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) = 0;
	virtual bool permissions_can_insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, const std::set<anh::HashString>& arrangement_to_use) = 0;
	virtual bool permissions_can_remove(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) = 0;

	virtual bool permissions_grant_view(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_revoke_view(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_grant_insert(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_revoke_insert(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_grant_removal(std::shared_ptr<anh::component::Entity> who) = 0;
	virtual bool permissions_revoke_removal(std::shared_ptr<anh::component::Entity> who) = 0;

	virtual bool permissions_grant_view(std::string argument) = 0;
	virtual bool permissions_revoke_view(std::string argument) = 0;
	virtual bool permissions_grant_insert(std::string argument) = 0;
	virtual bool permissions_revoke_insert(std::string argument) = 0;
	virtual bool permissions_grant_removal(std::string argument) = 0;
	virtual bool permissions_revoke_removal(std::string argument) = 0;

	//Size/Capacity Methods
	virtual bool empty() = 0;
	virtual bool full() = 0;

	virtual size_t size() = 0;
	virtual size_t capacity() = 0;
	virtual bool capacity(size_t new_capacity) = 0;

	virtual bool intrl_insert_(std::shared_ptr<anh::component::Entity> what, std::shared_ptr<ContainerComponentInterface> old_container) = 0;

	static std::shared_ptr<NullContainerComponent> NullComponent;
};

class NullContainerComponent : public  ContainerComponentInterface
{
public:
	NullContainerComponent() 
		: ContainerComponentInterface("Null") {}

	virtual bool has_entity(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) { return false; }
	virtual bool contained_objects(std::shared_ptr<anh::component::Entity> who, std::function<void(std::shared_ptr<anh::component::Entity>, std::shared_ptr<anh::component::Entity>)> funct, size_t max_depth=0, bool top_down=true) { return false; }
	virtual std::shared_ptr<anh::component::Entity> entity_in_slot(std::shared_ptr<anh::component::Entity> who,std::string slot_name) {return nullptr;}
	virtual std::set<std::shared_ptr<anh::component::Entity>> aware_entities(std::shared_ptr<anh::component::Entity> caller_hint) { return std::set<std::shared_ptr<anh::component::Entity>>(); }

	//Modification Methods
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_insertion) { return false; }
	virtual bool insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, unsigned int id, bool force_insertion) { return false; }
	virtual bool remove(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, bool force_removal) { return false; }
	virtual bool transfer_to( std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, std::shared_ptr<ContainerComponentInterface> recv_container, bool force_insertion, bool force_removal) { return false; }
	
	//Notification
	virtual void make_aware(std::shared_ptr<anh::component::Entity> what) { /* Nothing to update */ };
	virtual void state_update(std::shared_ptr<anh::component::Entity> what, glm::vec3& old) { /* Wont be called */ };
	virtual void make_unaware(std::shared_ptr<anh::component::Entity> what) { /* Nothing to update */ };

	//Permission Query Methods
	virtual bool permissions_can_view(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_can_insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) { return false; }
	virtual bool permissions_can_insert(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what, const std::set<anh::HashString>& arrangement_to_use) { return false; }
	virtual bool permissions_can_remove(std::shared_ptr<anh::component::Entity> who, std::shared_ptr<anh::component::Entity> what) { return false; }

	virtual bool permissions_grant_view(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_revoke_view(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_grant_insert(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_revoke_insert(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_grant_removal(std::shared_ptr<anh::component::Entity> who) { return false; }
	virtual bool permissions_revoke_removal(std::shared_ptr<anh::component::Entity> who) { return false; }

	virtual bool permissions_grant_view(std::string argument) { return false; }
	virtual bool permissions_revoke_view(std::string argument) { return false; }
	virtual bool permissions_grant_insert(std::string argument) { return false; }
	virtual bool permissions_revoke_insert(std::string argument) { return false; }
	virtual bool permissions_grant_removal(std::string argument) { return false; }
	virtual bool permissions_revoke_removal(std::string argument) { return false; }

	virtual bool empty() { return false; }
	virtual bool full() { return true; }

	virtual size_t size() { return 0; }
	virtual size_t capacity() { return null_permissions->capacity(); }
	virtual bool capacity(size_t new_capacity) { return false; }

	virtual bool intrl_insert_(std::shared_ptr<anh::component::Entity> what, std::shared_ptr<ContainerComponentInterface> old_container) { return false; }
private:
	static std::shared_ptr<NullContainerPermission> null_permissions;
};

};
};
};

#endif
module SeedData
    def self.extended(object)
        object.instance_exec do

            UserRole.destroy_all
            Role.destroy_all
            User.destroy_all
            @grant = User.create(name: "Grant")
            @austin = User.create(name: "Austin")
            @lucas = User.create(name: "Lucas")

            @admin = Role.create(name: "Admin")
            @customer = Role.create(name: "Customer")
            @super_user = Role.create(name: "Super User")

            UserRole.create(user: @grant, role: @super_user)

            @grant.roles << @admin

            @lucas.roles << @admin 
            @customer.users << @lucas

            @customer.user_roles.create(user: @austin)
            @austin.user_roles.create(role: @admin)
        end
    end
end
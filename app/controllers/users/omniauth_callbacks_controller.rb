class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        services = Service.where(proviser: auth.provider, uid: auth.uid).first

        if service.present?
            user = service.user
            service.update(
                expires_at: Time.at(auth.credentials.expires_at),
                access_token: auth.credentials.token,
            )
        
        else
            user= User.create(
                email: auth.info.email,
                password: Devise.friendly_token[0,20]
            )
            user.services.create(
                provider: auth.provider,
                uid: auth.uid,
                expires_at: Time.at(auth.credentials.expires_at),
                access_token: auth.credentials.token,
            )
        end

        sign_in_and_redirect user, event: :authentication
        set_flash_message :notice, :success, kind: "Facebook"
    end

    def auth
        request.env['omniauth.auth']
    end
end
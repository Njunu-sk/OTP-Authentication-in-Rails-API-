# Authenticate your API with OTP

- Authenticate your Rails API with Twilio

### Clone the repo

```bash
git@github.com:Njunu-sk/OTP-Authentication-in-Rails-API..git
```

```bash
bundle install
```

- Run spec files

```bash
bundle exec rspec
```

![specs](/public/images/specs.png)

## Add your env configurations

```bash
REDIS_URL=redis://127.0.0.1:XXXX/0
AUTH_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXX
SERVICE_SID=XXXXXXXXXXXXXXXXXXXXXXXX
ACCOUNT_SID=XXXXXXXXXXXXXXXXXXXXXXXX
```

- Get service id from `Verify Service` Twilio

- Make sure you have `sidekiq` installed.

- Start sidekiq and rails server

```bash
bundle exec sidekiq
```

```
rails s
```

## Interacting with your API

- Make sure you have `postman` installed

- Visit `localhost:3000/send_otp_code`, this is a `POST` request, we are prompting Twilio to send us an otp.

![Send OTP](/public/images/send_otp.png)

- Check the logs

![Send OTP logs](/public/images/otp.png)

- You will receive a `valid token` in your mobile, replace phonenumber and country code.

### Create a User

- Visit `localhost:3000/user`, this is a `POST` request.

![Send OTP logs](/public/images/create_user.png)

- Check logs

![Send OTP logs](/public/images/create_user_logs.png)

- You have Authenticated a User with OTP.

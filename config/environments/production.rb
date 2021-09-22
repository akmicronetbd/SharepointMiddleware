require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "SharePointMid_production"

  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Log disallowed deprecations.
  config.active_support.disallowed_deprecation = :log

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require "syslog/logger"
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Inserts middleware to perform automatic connection switching.
  # The `database_selector` hash is used to pass options to the DatabaseSelector
  # middleware. The `delay` is used to determine how long to wait after a write
  # to send a subsequent read to the primary.
  #
  # The `database_resolver` class is used by the middleware to determine which
  # database is appropriate to use based on the time delay.
  #
  # The `database_resolver_context` class is used by the middleware to set
  # timestamps for the last write to the primary. The resolver uses the context
  # class timestamps to determine how long to wait before reading from the
  # replica.
  #
  # By default Rails will store a last write timestamp in the session. The
  # DatabaseSelector middleware is designed as such you can define your own
  # strategy for connection switching and pass that into the middleware through
  # these configuration options.
  # config.active_record.database_selector = { delay: 2.seconds }
  # config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  # config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
end
DOCUSIGN_CALLBACK_URL = "http://3.88.138.251/oauth/auth"
DOCUSIGN_URL = "https://account-d.docusign.com/oauth/token"
DOCUSING_USER_INFO_URL = "https://account-d.docusign.com/oauth/userinfo"
DOCUSIGN_CLIENT_ID = "e459d13a-b795-419c-92fb-2ea571025cde"
DOCUSIGN_INTEGRATION_KEY = "191e6bde-d3a1-44d4-b523-cf2fcae40862"
DOCUSIGN_AUD_URL = "account-d.docusign.com"
DOCUSIGN_UAT_URL = "https://apidownloaduatna11.springcm.com/v2/"
DOCUSIGN_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjSEZ0lyJ248Ga2Xg6JmG
PS0gegUa09pPVEeCqQ/7O0ZMTRIaqAxZGWK921kGYgUZU2lnaRCAZ7Bj5P+PII6i
nazZTT3UzIEwS5VC+jHpIFeZuqlycUXuUrOMceaIeDi8dNDk8mWyRiNleaE19vcp
n5ZQF6rgqOFm6l8zfTjDCCbqaVzCMDmjkG2Z6Ys4IlTcNND6QZg5KlnWsVvLRajz
Q9uVD1T4vhz6/BcXHQlnlghlbrpvgaiLJawNzOn/7EWecnO1IK8JckBC2szmy7mE
IqKRum1l8ea0Zte+idL0rqXgt72CZhUhJb4CwsPuHv2/OP6/3QqjImsg3W4sJINZ
7QIDAQAB
-----END PUBLIC KEY-----"
DOCUSIGN_PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAjSEZ0lyJ248Ga2Xg6JmGPS0gegUa09pPVEeCqQ/7O0ZMTRIa
qAxZGWK921kGYgUZU2lnaRCAZ7Bj5P+PII6inazZTT3UzIEwS5VC+jHpIFeZuqly
cUXuUrOMceaIeDi8dNDk8mWyRiNleaE19vcpn5ZQF6rgqOFm6l8zfTjDCCbqaVzC
MDmjkG2Z6Ys4IlTcNND6QZg5KlnWsVvLRajzQ9uVD1T4vhz6/BcXHQlnlghlbrpv
gaiLJawNzOn/7EWecnO1IK8JckBC2szmy7mEIqKRum1l8ea0Zte+idL0rqXgt72C
ZhUhJb4CwsPuHv2/OP6/3QqjImsg3W4sJINZ7QIDAQABAoIBABBjCouEK+Gu5BuY
/cTO/BOjEhqjoxom8X/ODzGFkIdbwe+lAtaxGwYOkrr4cFGgrpsifwZntcZ/ExT7
nj6KhqlGRl5op9/YaaeCZ6ouHMKg8/xaQSvpPHilLnvp574F4HlelBGX61unhS3a
oS3RmdH/ncHRw+T4HyoRmc9CxaqZeyxkSOyKtJX24dAr0gouIMVJKy8xdolQ43pO
Xqr2hDEaC5vuxCS4A7knL2E/QFKzbilGIuGRfcG89Tiq21Y0fXCc0XEi+EFnuJ1P
xFulKbnFSTYkIk5/V2Egf/PjKBD0XwYtkAEpJziVanCX9TnBV3ECER+B+cT3XJv9
Q/0UHoUCgYEA0O7nFT6gUtoWjTlSjJdQtlrItSSdppPkjZL3iXtDDmPe5ERXbxvM
lFqNd4sV3P/dyEXbmHVjiHip9WH5mBDsExigccSo9N7Xap0czODgwMT4nHRnE8Au
M32hbFdu1Z0qHeGevVk6mGaBkTfuOdatOmvb5uGmoBZVEbfd7lcIjxcCgYEArOv5
C8BIJTx5njVJF1pAv7mPJSFlzuFuOlUWJHpNhW+VRn98hS1TiYAUJAkWiBwlZ3SZ
ODEd6H69B+mS8D+P67rn3G3w1uYC4HtlVrRreN0TJOr32fYCAMQqdEYXD8e3LCvx
MNAgJdmfigWRVviIGVa+/tTpq9EkWT85jzbrYZsCgYBeZoL8Y1Z2+NjVqD+3DCtI
qU4kIk4k1I+gs/WqJYpPtyofQw2qQwo1QZDHoY0YVHc1pPKqOOfm4nYQS9tFLOgt
XKQpoyyfrwvvvNslarnB/31A24szLlLxquLDm+GVHLTJ2YYqkWVbNH14SqgVc/zC
97bc47mwfUakgcoBhUt1swKBgQCSpl1D1gJZcfxCbDZck7It5xS7DKPm29A7sEVj
EkYEUCls7FmSKGqcRf7OwNZXAGfIYV5ABYez0ShHOZPgJEfOR2izzJlf5xmxf3Tm
H4S1r+e4e31PYA86zyKiEX8lZt61m16lYxygfPuMdkRYWdYyhxrby32QtYH6HmCW
UKE22QKBgH/xBTNQAXZ66Vw1hu15UEt+iy5Kd3y80EdbHKaGZVSi7mdhRQLJ0j5t
mEDm5TF8R+pu9ary5o2kHxFWF/tmVOf03FAKLccKGzl+K9doSkwnku8+rxdI5+gN
wUZQ851uXEht0zO4DEVf3e3CRQW/DYp9mwsULMt5ONGzXKLq0jZD
-----END RSA PRIVATE KEY-----"

SHAREPOINT_ACCESS_URL = "https://accounts.accesscontrol.windows.net/"
SHAREPOINT_ACCESS_ID = "95d0540a-43ad-405d-8a01-c35d08c3d4b4"
SHAREPOINT_CLIENT_ID = "c02870dc-1df5-4b55-95c5-0473087668ed@95d0540a-43ad-405d-8a01-c35d08c3d4b4"
SHAREPOINT_CLIENT_SECRET = "YAs+8n2wAoUNKdCpcluMjjEPc9geruFQHGampNSI+PY="
SHAREPOINT_RESOURCE = "00000003-0000-0ff1-ce00-000000000000/micronetbdorg.sharepoint.com@95d0540a-43ad-405d-8a01-c35d08c3d4b4"
SHAREPOINT_UPLOAD_URL = "https://micronetbdorg.sharepoint.com/sites/CLMIntegration/_api/web/GetFolderByServerRelativeUrl('Shared Documents/Workflow')/Files/Add"
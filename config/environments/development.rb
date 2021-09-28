require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end
DOCUSIGN_CALLBACK_URL = "http://localhost:3000/oauth/auth"
DOCUSIGN_URL = "https://account-d.docusign.com/oauth/token"
DOCUSING_USER_INFO_URL = "https://account-d.docusign.com/oauth/userinfo"
DOCUSIGN_CLIENT_ID = "e459d13a-b795-419c-92fb-2ea571025cde"
DOCUSIGN_INTEGRATION_KEY = "191e6bde-d3a1-44d4-b523-cf2fcae40862"
DOCUSIGN_AUD_URL = "account-d.docusign.com"
DOCUSIGN_UAT_URL = "https://apidownloaduatna11.springcm.com/v2/"
DOCUSIGN_API_USER_ID = "85f56946-2679-4b6d-8bbf-0578668c661f"
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
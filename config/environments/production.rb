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
DOCUSIGN_URL = "https://account.docusign.com/oauth/token"
DOCUSING_USER_INFO_URL = "https://account.docusign.com/oauth/userinfo"
DOCUSIGN_CLIENT_ID = "80967823-cf4c-4c9d-8988-cb1944d02582"
DOCUSIGN_INTEGRATION_KEY = "80967823-cf4c-4c9d-8988-cb1944d02582"
DOCUSIGN_AUD_URL = "account.docusign.com"
DOCUSIGN_UAT_URL = "https://apidownloaduatna11.springcm.com"
DOCUSIGN_API_USER_ID = "80967823-cf4c-4c9d-8988-cb1944d02582"
DOCUSIGN_PUBLIC_KEY = ""
DOCUSIGN_PRIVATE_KEY = ""
DOCUSIGN_API_CLIENT_ID = "691e8b1a-fdc8-4c8b-8daa-56298e58c09f"
DOCUSIGN_API_CLIENT_SECRET = "e875bf8d34e342d8b98d9e554a3f28abLLodvXFccPFBB8PoKm5YQR04w85B9p8APhP3OWrnmeyviuM350zF2yd8yqWtfYQ944tIS4GsQSkVoNtZJ3kFQwarDjhrliE9"
DOCUSIGN_API_AUTH_URL = "https://authuat.springcm.com/api/v201606/apiuser"

SHAREPOINT_ACCESS_URL = "https://accounts.accesscontrol.windows.net/"
SHAREPOINT_ACCESS_ID = "d77c7f4d-d767-461f-b625-0628792e9e2a"
SHAREPOINT_CLIENT_ID = "ac575412-3f48-41e9-bced-f287d6109ca3@d77c7f4d-d767-461f-b625-0628792e9e2a"
SHAREPOINT_CLIENT_SECRET = "3PBY2ro2ryEwgR3/QABTtDZWAp3RcOmb/4aveV+x2Jo="
SHAREPOINT_RESOURCE = "00000003-0000-0ff1-ce00-000000000000/kymsoffice.sharepoint.com@d77c7f4d-d767-461f-b625-0628792e9e2a"
SHAREPOINT_UPLOAD_URL = "https://kymsoffice.sharepoint.com/sites/TestProjectOnline/DPGO RFP Project/_api/web/GetFolderByServerRelativeUrl('Contract Library/"
SHAREPOINT_FOLDER_CREATE_URL = "https://kymsoffice.sharepoint.com/sites/TestProjectOnline/DPGO RFP Project/_api/web/folders"
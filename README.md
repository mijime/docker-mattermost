# docker-mattermost

Example
===

See.

[`Use MySQL`](examples/use-mysql)
[`Use Postgres`](examples/use-postgres)
[`Use SSL`](examples/use-ssl)

Variable
===

See.

[`Template file`](assets/runtime/config.json.tmpl)
[`Enviroment Name Rule`](scripts/convert-json.awk)

| selection | configuration name | env | default |
| :--- | :--- | :--- | :--- |
| ServiceSettings | ListenAddress | SERVICE_LISTEN_ADDRESS | ":80" |
| ServiceSettings | MaximumLoginAttempts | SERVICE_MAXIMUM_LOGIN_ATTEMPTS | 10 |
| ServiceSettings | SegmentDeveloperKey | SERVICE_SEGMENT_DEVELOPER_KEY | "" |
| ServiceSettings | GoogleDeveloperKey | SERVICE_GOOGLE_DEVELOPER_KEY | "" |
| ServiceSettings | EnableOAuthServiceProvider | SERVICE_ENABLE_OAUTH_SERVICE_PROVIDER | false |
| ServiceSettings | EnableIncomingWebhooks | SERVICE_ENABLE_INCOMING_WEBHOOKS | false |
| ServiceSettings | EnableOutgoingWebhooks | SERVICE_ENABLE_OUTGOING_WEBHOOKS | false |
| ServiceSettings | EnableCommands | SERVICE_ENABLE_COMMANDS | false |
| ServiceSettings | EnableOnlyAdminIntegrations | SERVICE_ENABLE_ONLY_ADMIN_INTEGRATIONS | true |
| ServiceSettings | EnablePostUsernameOverride | SERVICE_ENABLE_POST_USERNAME_OVERRIDE | false |
| ServiceSettings | EnablePostIconOverride | SERVICE_ENABLE_POST_ICON_OVERRIDE | false |
| ServiceSettings | EnableTesting | SERVICE_ENABLE_TESTING | false |
| ServiceSettings | EnableDeveloper | SERVICE_ENABLE_DEVELOPER | false |
| ServiceSettings | EnableSecurityFixAlert | SERVICE_ENABLE_SECURITY_FIX_ALERT | true |
| ServiceSettings | EnableInsecureOutgoingConnections | SERVICE_ENABLE_INSECURE_OUTGOING_CONNECTIONS | false |
| ServiceSettings | AllowCorsFrom | SERVICE_ALLOW_CORS_FROM | "" |
| ServiceSettings | SessionLengthWebInDays | SERVICE_SESSION_LENGTH_WEB_IN_DAYS | 30 |
| ServiceSettings | SessionLengthMobileInDays | SERVICE_SESSION_LENGTH_MOBILE_IN_DAYS | 30 |
| ServiceSettings | SessionLengthSSOInDays | SERVICE_SESSION_LENGTH_SSOIN_DAYS | 30 |
| ServiceSettings | SessionCacheInMinutes | SERVICE_SESSION_CACHE_IN_MINUTES | 10 |
| TeamSettings | SiteName | TEAM_SITE_NAME | "Mattermost" |
| TeamSettings | MaxUsersPerTeam | TEAM_MAX_USERS_PER_TEAM | 50 |
| TeamSettings | EnableTeamCreation | TEAM_ENABLE_TEAM_CREATION | true |
| TeamSettings | EnableUserCreation | TEAM_ENABLE_USER_CREATION | true |
| TeamSettings | RestrictCreationToDomains | TEAM_RESTRICT_CREATION_TO_DOMAINS | "" |
| TeamSettings | RestrictTeamNames | TEAM_RESTRICT_TEAM_NAMES | true |
| TeamSettings | EnableTeamListing | TEAM_ENABLE_TEAM_LISTING | false |
| SqlSettings | DriverName | SQL_DRIVER_NAME | "mysql" |
| SqlSettings | DataSource | SQL_DATA_SOURCE | "mmuser:mostest@tcp(dockerhost:3306)/mattermost_test?charset=utf8mb4,utf8" |
| SqlSettings | DataSourceReplicas | SQL_DATA_SOURCE_REPLICAS | [] |
| SqlSettings | MaxIdleConns | SQL_MAX_IDLE_CONNS | 10 |
| SqlSettings | MaxOpenConns | SQL_MAX_OPEN_CONNS | 10 |
| SqlSettings | Trace | SQL_TRACE | false |
| SqlSettings | AtRestEncryptKey | SQL_AT_REST_ENCRYPT_KEY | "7rAh6iwQCkV4cA1Gsg3fgGOXJAQ43QVg" |
| LogSettings | EnableConsole | LOG_ENABLE_CONSOLE | true |
| LogSettings | ConsoleLevel | LOG_CONSOLE_LEVEL | "INFO" |
| LogSettings | EnableFile | LOG_ENABLE_FILE | true |
| LogSettings | FileLevel | LOG_FILE_LEVEL | "INFO" |
| LogSettings | FileFormat | LOG_FILE_FORMAT | "" |
| LogSettings | FileLocation | LOG_FILE_LOCATION | "" |
| FileSettings | DriverName | FILE_DRIVER_NAME | "local" |
| FileSettings | Directory | FILE_DIRECTORY | "./data/" |
| FileSettings | EnablePublicLink | FILE_ENABLE_PUBLIC_LINK | false |
| FileSettings | PublicLinkSalt | FILE_PUBLIC_LINK_SALT | "A705AklYF8MFDOfcwh3I488G8vtLlVip" |
| FileSettings | ThumbnailWidth | FILE_THUMBNAIL_WIDTH | 120 |
| FileSettings | ThumbnailHeight | FILE_THUMBNAIL_HEIGHT | 100 |
| FileSettings | PreviewWidth | FILE_PREVIEW_WIDTH | 1024 |
| FileSettings | PreviewHeight | FILE_PREVIEW_HEIGHT | 0 |
| FileSettings | ProfileWidth | FILE_PROFILE_WIDTH | 128 |
| FileSettings | ProfileHeight | FILE_PROFILE_HEIGHT | 128 |
| FileSettings | InitialFont | FILE_INITIAL_FONT | "luximbi.ttf" |
| FileSettings | AmazonS3AccessKeyId | FILE_AMAZON_S3_ACCESS_KEY_ID | "" |
| FileSettings | AmazonS3SecretAccessKey | FILE_AMAZON_S3_SECRET_ACCESS_KEY | "" |
| FileSettings | AmazonS3Bucket | FILE_AMAZON_S3_BUCKET | "" |
| FileSettings | AmazonS3Region | FILE_AMAZON_S3_REGION | "" |
| FileSettings | AmazonS3Endpoint | FILE_AMAZON_S3_ENDPOINT | "" |
| FileSettings | AmazonS3BucketEndpoint | FILE_AMAZON_S3_BUCKET_ENDPOINT | "" |
| FileSettings | AmazonS3LocationConstraint | FILE_AMAZON_S3_LOCATION_CONSTRAINT | false |
| FileSettings | AmazonS3LowercaseBucket | FILE_AMAZON_S3_LOWERCASE_BUCKET | false |
| EmailSettings | EnableSignUpWithEmail | EMAIL_ENABLE_SIGN_UP_WITH_EMAIL | true |
| EmailSettings | EnableSignInWithEmail | EMAIL_ENABLE_SIGN_IN_WITH_EMAIL | true |
| EmailSettings | EnableSignInWithUsername | EMAIL_ENABLE_SIGN_IN_WITH_USERNAME | false |
| EmailSettings | SendEmailNotifications | EMAIL_SEND_EMAIL_NOTIFICATIONS | false |
| EmailSettings | RequireEmailVerification | EMAIL_REQUIRE_EMAIL_VERIFICATION | false |
| EmailSettings | FeedbackName | EMAIL_FEEDBACK_NAME | "" |
| EmailSettings | FeedbackEmail | EMAIL_FEEDBACK_EMAIL | "" |
| EmailSettings | SMTPUsername | EMAIL_SMTP_USERNAME | "" |
| EmailSettings | SMTPPassword | EMAIL_SMTP_PASSWORD | "" |
| EmailSettings | SMTPServer | EMAIL_SMTP_SERVER | "" |
| EmailSettings | SMTPPort | EMAIL_SMTP_PORT | "" |
| EmailSettings | ConnectionSecurity | EMAIL_CONNECTION_SECURITY | "" |
| EmailSettings | InviteSalt | EMAIL_INVITE_SALT | "bjlSR4QqkXFBr7TP4oDzlfZmcNuH9YoS" |
| EmailSettings | PasswordResetSalt | EMAIL_PASSWORD_RESET_SALT | "vZ4DcKyVVRlKHHJpexcuXzojkE5PZ5eL" |
| EmailSettings | SendPushNotifications | EMAIL_SEND_PUSH_NOTIFICATIONS | false |
| EmailSettings | PushNotificationServer | EMAIL_PUSH_NOTIFICATION_SERVER | "" |
| RateLimitSettings | EnableRateLimiter | RATELIMIT_ENABLE_RATE_LIMITER | true |
| RateLimitSettings | PerSec | RATELIMIT_PER_SEC | 10 |
| RateLimitSettings | MemoryStoreSize | RATELIMIT_MEMORY_STORE_SIZE | 10000 |
| RateLimitSettings | VaryByRemoteAddr | RATELIMIT_VARY_BY_REMOTE_ADDR | true |
| RateLimitSettings | VaryByHeader | RATELIMIT_VARY_BY_HEADER | "" |
| PrivacySettings | ShowEmailAddress | PRIVACY_SHOW_EMAIL_ADDRESS | true |
| PrivacySettings | ShowFullName | PRIVACY_SHOW_FULL_NAME | true |
| SupportSettings | TermsOfServiceLink | SUPPORT_TERMS_OF_SERVICE_LINK | "/static/help/terms.html" |
| SupportSettings | PrivacyPolicyLink | SUPPORT_PRIVACY_POLICY_LINK | "/static/help/privacy.html" |
| SupportSettings | AboutLink | SUPPORT_ABOUT_LINK | "/static/help/about.html" |
| SupportSettings | HelpLink | SUPPORT_HELP_LINK | "/static/help/help.html" |
| SupportSettings | ReportAProblemLink | SUPPORT_REPORT_APROBLEM_LINK | "/static/help/report_problem.html" |
| SupportSettings | SupportEmail | SUPPORT_SUPPORT_EMAIL | "feedback@mattermost.com" |
| GitLabSettings | Enable | GITLAB_ENABLE | false |
| GitLabSettings | Secret | GITLAB_SECRET | "" |
| GitLabSettings | Id | GITLAB_ID | "" |
| GitLabSettings | Scope | GITLAB_SCOPE | "" |
| GitLabSettings | AuthEndpoint | GITLAB_AUTH_ENDPOINT | "" |
| GitLabSettings | TokenEndpoint | GITLAB_TOKEN_ENDPOINT | "" |
| GitLabSettings | UserApiEndpoint | GITLAB_USER_API_ENDPOINT | "" |

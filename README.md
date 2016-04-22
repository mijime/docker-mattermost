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

### ServiceSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| ListenAddress | SERVICE_LISTEN_ADDRESS | ":80" |
| MaximumLoginAttempts | SERVICE_MAXIMUM_LOGIN_ATTEMPTS | 10 |
| SegmentDeveloperKey | SERVICE_SEGMENT_DEVELOPER_KEY | "" |
| GoogleDeveloperKey | SERVICE_GOOGLE_DEVELOPER_KEY | "" |
| EnableOAuthServiceProvider | SERVICE_ENABLE_OAUTH_SERVICE_PROVIDER | false |
| EnableIncomingWebhooks | SERVICE_ENABLE_INCOMING_WEBHOOKS | false |
| EnableOutgoingWebhooks | SERVICE_ENABLE_OUTGOING_WEBHOOKS | false |
| EnableCommands | SERVICE_ENABLE_COMMANDS | false |
| EnableOnlyAdminIntegrations | SERVICE_ENABLE_ONLY_ADMIN_INTEGRATIONS | true |
| EnablePostUsernameOverride | SERVICE_ENABLE_POST_USERNAME_OVERRIDE | false |
| EnablePostIconOverride | SERVICE_ENABLE_POST_ICON_OVERRIDE | false |
| EnableTesting | SERVICE_ENABLE_TESTING | false |
| EnableDeveloper | SERVICE_ENABLE_DEVELOPER | false |
| EnableSecurityFixAlert | SERVICE_ENABLE_SECURITY_FIX_ALERT | true |
| EnableInsecureOutgoingConnections | SERVICE_ENABLE_INSECURE_OUTGOING_CONNECTIONS | false |
| AllowCorsFrom | SERVICE_ALLOW_CORS_FROM | "" |
| SessionLengthWebInDays | SERVICE_SESSION_LENGTH_WEB_IN_DAYS | 30 |
| SessionLengthMobileInDays | SERVICE_SESSION_LENGTH_MOBILE_IN_DAYS | 30 |
| SessionLengthSSOInDays | SERVICE_SESSION_LENGTH_SSOIN_DAYS | 30 |
| SessionCacheInMinutes | SERVICE_SESSION_CACHE_IN_MINUTES | 10 |

### TeamSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| SiteName | TEAM_SITE_NAME | "Mattermost" |
| MaxUsersPerTeam | TEAM_MAX_USERS_PER_TEAM | 50 |
| EnableTeamCreation | TEAM_ENABLE_TEAM_CREATION | true |
| EnableUserCreation | TEAM_ENABLE_USER_CREATION | true |
| RestrictCreationToDomains | TEAM_RESTRICT_CREATION_TO_DOMAINS | "" |
| RestrictTeamNames | TEAM_RESTRICT_TEAM_NAMES | true |
| EnableTeamListing | TEAM_ENABLE_TEAM_LISTING | false |

### SqlSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| DriverName | SQL_DRIVER_NAME | "mysql" |
| DataSource | SQL_DATA_SOURCE | "mmuser:mostest@tcp(dockerhost:3306)/mattermost_test?charset=utf8mb4,utf8" |
| DataSourceReplicas | SQL_DATA_SOURCE_REPLICAS | [] |
| MaxIdleConns | SQL_MAX_IDLE_CONNS | 10 |
| MaxOpenConns | SQL_MAX_OPEN_CONNS | 10 |
| Trace | SQL_TRACE | false |
| AtRestEncryptKey | SQL_AT_REST_ENCRYPT_KEY | "7rAh6iwQCkV4cA1Gsg3fgGOXJAQ43QVg" |

### LogSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| EnableConsole | LOG_ENABLE_CONSOLE | true |
| ConsoleLevel | LOG_CONSOLE_LEVEL | "INFO" |
| EnableFile | LOG_ENABLE_FILE | true |
| FileLevel | LOG_FILE_LEVEL | "INFO" |
| FileFormat | LOG_FILE_FORMAT | "" |
| FileLocation | LOG_FILE_LOCATION | "" |

### FileSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| DriverName | FILE_DRIVER_NAME | "local" |
| Directory | FILE_DIRECTORY | "./data/" |
| EnablePublicLink | FILE_ENABLE_PUBLIC_LINK | false |
| PublicLinkSalt | FILE_PUBLIC_LINK_SALT | "A705AklYF8MFDOfcwh3I488G8vtLlVip" |
| ThumbnailWidth | FILE_THUMBNAIL_WIDTH | 120 |
| ThumbnailHeight | FILE_THUMBNAIL_HEIGHT | 100 |
| PreviewWidth | FILE_PREVIEW_WIDTH | 1024 |
| PreviewHeight | FILE_PREVIEW_HEIGHT | 0 |
| ProfileWidth | FILE_PROFILE_WIDTH | 128 |
| ProfileHeight | FILE_PROFILE_HEIGHT | 128 |
| InitialFont | FILE_INITIAL_FONT | "luximbi.ttf" |
| AmazonS3AccessKeyId | FILE_AMAZON_S3_ACCESS_KEY_ID | "" |
| AmazonS3SecretAccessKey | FILE_AMAZON_S3_SECRET_ACCESS_KEY | "" |
| AmazonS3Bucket | FILE_AMAZON_S3_BUCKET | "" |
| AmazonS3Region | FILE_AMAZON_S3_REGION | "" |
| AmazonS3Endpoint | FILE_AMAZON_S3_ENDPOINT | "" |
| AmazonS3BucketEndpoint | FILE_AMAZON_S3_BUCKET_ENDPOINT | "" |
| AmazonS3LocationConstraint | FILE_AMAZON_S3_LOCATION_CONSTRAINT | false |
| AmazonS3LowercaseBucket | FILE_AMAZON_S3_LOWERCASE_BUCKET | false |

### EmailSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| EnableSignUpWithEmail | EMAIL_ENABLE_SIGN_UP_WITH_EMAIL | true |
| EnableSignInWithEmail | EMAIL_ENABLE_SIGN_IN_WITH_EMAIL | true |
| EnableSignInWithUsername | EMAIL_ENABLE_SIGN_IN_WITH_USERNAME | false |
| SendEmailNotifications | EMAIL_SEND_EMAIL_NOTIFICATIONS | false |
| RequireEmailVerification | EMAIL_REQUIRE_EMAIL_VERIFICATION | false |
| FeedbackName | EMAIL_FEEDBACK_NAME | "" |
| FeedbackEmail | EMAIL_FEEDBACK_EMAIL | "" |
| SMTPUsername | EMAIL_SMTP_USERNAME | "" |
| SMTPPassword | EMAIL_SMTP_PASSWORD | "" |
| SMTPServer | EMAIL_SMTP_SERVER | "" |
| SMTPPort | EMAIL_SMTP_PORT | "" |
| ConnectionSecurity | EMAIL_CONNECTION_SECURITY | "" |
| InviteSalt | EMAIL_INVITE_SALT | "bjlSR4QqkXFBr7TP4oDzlfZmcNuH9YoS" |
| PasswordResetSalt | EMAIL_PASSWORD_RESET_SALT | "vZ4DcKyVVRlKHHJpexcuXzojkE5PZ5eL" |
| SendPushNotifications | EMAIL_SEND_PUSH_NOTIFICATIONS | false |
| PushNotificationServer | EMAIL_PUSH_NOTIFICATION_SERVER | "" |

### RateLimitSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| EnableRateLimiter | RATELIMIT_ENABLE_RATE_LIMITER | true |
| PerSec | RATELIMIT_PER_SEC | 10 |
| MemoryStoreSize | RATELIMIT_MEMORY_STORE_SIZE | 10000 |
| VaryByRemoteAddr | RATELIMIT_VARY_BY_REMOTE_ADDR | true |
| VaryByHeader | RATELIMIT_VARY_BY_HEADER | "" |

### PrivacySettings

| configuration name | env | default |
| :--- | :--- | :--- |
| ShowEmailAddress | PRIVACY_SHOW_EMAIL_ADDRESS | true |
| ShowFullName | PRIVACY_SHOW_FULL_NAME | true |

### SupportSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| TermsOfServiceLink | SUPPORT_TERMS_OF_SERVICE_LINK | "/static/help/terms.html" |
| PrivacyPolicyLink | SUPPORT_PRIVACY_POLICY_LINK | "/static/help/privacy.html" |
| AboutLink | SUPPORT_ABOUT_LINK | "/static/help/about.html" |
| HelpLink | SUPPORT_HELP_LINK | "/static/help/help.html" |
| ReportAProblemLink | SUPPORT_REPORT_APROBLEM_LINK | "/static/help/report_problem.html" |
| SupportEmail | SUPPORT_SUPPORT_EMAIL | "feedback@mattermost.com" |

### GitLabSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | GITLAB_ENABLE | false |
| Secret | GITLAB_SECRET | "" |
| Id | GITLAB_ID | "" |
| Scope | GITLAB_SCOPE | "" |
| AuthEndpoint | GITLAB_AUTH_ENDPOINT | "" |
| TokenEndpoint | GITLAB_TOKEN_ENDPOINT | "" |
| UserApiEndpoint | GITLAB_USER_API_ENDPOINT | "" |

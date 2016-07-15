# docker-mattermost

Example
===

Create a mysql container.

`docker run --name=some-mysql --env="MYSQL_DATABASE=mattermost" --env="MYSQL_ROOT_PASSWORD=ch4ngeIt0" --detach mysql`

Create a mattermost container, and link the mysql container.

`docker run --link=some-mysql:mysql --publish=8080:80 --detach mijime/mattermost`

If you want to connect to an existing database...

```
docker run --detach --publish=8080:80 \
  --env SQL_DATA_SOURCE="exists-user:exists-passsword@tcp(exists-dbhost:3306)/exists-dbname?charset=utf8mb4,utf8" \
  mijime/mattermost
```

Change the part `exists-*`.

If you want to change the file storage to s3...

```
docker run --detach --publish=8080:80 \
  --link=some-mysql:mysql \
  --env FILE_DRIVER_NAME=amazons3 \
  --env FILE_AMAZON_S3_ACCESS_KEY_ID=AKI1234567890EXAMPLE \
  --env FILE_AMAZON_S3_SECRET_ACCESS_KEY=secretAccessKey1234 \
  --env FILE_AMAZON_S3_REGION=ap-northeast-1 \
  --env FILE_AMAZON_S3_BUCKET=your-s3-bucket-names \
  mijime/mattermost
```

See.

[`Use MySQL`](examples/use-mysql)
[`Use Postgres`](examples/use-postgres)
[`Use SSL`](examples/use-ssl)

Variable
===

See.

[`Template file`](assets/runtime/config.json.tmpl)
[`Enviroment Name Rule`](scripts/convert-json.awk)

### ContainerSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Wait for other application | MATTERMOST_START_DELAY | |

### ServiceSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| ListenAddress | SERVICE_LISTEN_ADDRESS | ":80" |
| MaximumLoginAttempts | SERVICE_MAXIMUM_LOGIN_ATTEMPTS | 10 |
| SegmentDeveloperKey | SERVICE_SEGMENT_DEVELOPER_KEY | "" |
| GoogleDeveloperKey | SERVICE_GOOGLE_DEVELOPER_KEY | "" |
| EnableOAuthServiceProvider | SERVICE_ENABLE_OAUTH_SERVICE_PROVIDER | false |
| EnableIncomingWebhooks | SERVICE_ENABLE_INCOMING_WEBHOOKS | true |
| EnableOutgoingWebhooks | SERVICE_ENABLE_OUTGOING_WEBHOOKS | true |
| EnableCommands | SERVICE_ENABLE_COMMANDS | true |
| EnableOnlyAdminIntegrations | SERVICE_ENABLE_ONLY_ADMIN_INTEGRATIONS | true |
| EnablePostUsernameOverride | SERVICE_ENABLE_POST_USERNAME_OVERRIDE | false |
| EnablePostIconOverride | SERVICE_ENABLE_POST_ICON_OVERRIDE | false |
| EnableTesting | SERVICE_ENABLE_TESTING | false |
| EnableDeveloper | SERVICE_ENABLE_DEVELOPER | false |
| EnableSecurityFixAlert | SERVICE_ENABLE_SECURITY_FIX_ALERT | true |
| EnableInsecureOutgoingConnections | SERVICE_ENABLE_INSECURE_OUTGOING_CONNECTIONS | false |
| EnableMultifactorAuthentication | SERVICE_ENABLE_MULTIFACTOR_AUTHENTICATION | false |
| AllowCorsFrom | SERVICE_ALLOW_CORS_FROM | "" |
| SessionLengthWebInDays | SERVICE_SESSION_LENGTH_WEB_IN_DAYS | 30 |
| SessionLengthMobileInDays | SERVICE_SESSION_LENGTH_MOBILE_IN_DAYS | 30 |
| SessionLengthSSOInDays | SERVICE_SESSION_LENGTH_SSOIN_DAYS | 30 |
| SessionCacheInMinutes | SERVICE_SESSION_CACHE_IN_MINUTES | 10 |
| WebsocketSecurePort | SERVICE_WEBSOCKET_SECURE_PORT | 443 |
| WebsocketPort | SERVICE_WEBSOCKET_PORT | 80 |
| WebserverMode | SERVICE_WEBSERVER_MODE | "gzip" |
| EnableCustomEmoji | SERVICE_ENABLE_CUSTOM_EMOJI | false |
| RestrictCustomEmojiCreation | SERVICE_RESTRICT_CUSTOM_EMOJI_CREATION | "all" |

### TeamSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| SiteName | TEAM_SITE_NAME | "Mattermost" |
| MaxUsersPerTeam | TEAM_MAX_USERS_PER_TEAM | 50 |
| EnableTeamCreation | TEAM_ENABLE_TEAM_CREATION | true |
| EnableUserCreation | TEAM_ENABLE_USER_CREATION | true |
| EnableOpenServer | TEAM_ENABLE_OPEN_SERVER | false |
| RestrictCreationToDomains | TEAM_RESTRICT_CREATION_TO_DOMAINS | "" |
| RestrictTeamNames | TEAM_RESTRICT_TEAM_NAMES | true |
| EnableCustomBrand | TEAM_ENABLE_CUSTOM_BRAND | false |
| CustomBrandText | TEAM_CUSTOM_BRAND_TEXT | "" |
| RestrictDirectMessage | TEAM_RESTRICT_DIRECT_MESSAGE | "any" |
| RestrictTeamInvite | TEAM_RESTRICT_TEAM_INVITE | "all" |
| RestrictPublicChannelManagement | TEAM_RESTRICT_PUBLIC_CHANNEL_MANAGEMENT | "all" |
| RestrictPrivateChannelManagement | TEAM_RESTRICT_PRIVATE_CHANNEL_MANAGEMENT | "all" |

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
| EnableWebhookDebugging | LOG_ENABLE_WEBHOOK_DEBUGGING | true |

### PasswordSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| MinimumLength | PASSWORD_MINIMUM_LENGTH | 5 |
| Lowercase | PASSWORD_LOWERCASE | false |
| Number | PASSWORD_NUMBER | false |
| Uppercase | PASSWORD_UPPERCASE | false |
| Symbol | PASSWORD_SYMBOL | false |

### FileSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| MaxFileSize | FILE_MAX_FILE_SIZE | 52428800 |
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
| EnableSignInWithUsername | EMAIL_ENABLE_SIGN_IN_WITH_USERNAME | true |
| SendEmailNotifications | EMAIL_SEND_EMAIL_NOTIFICATIONS | false |
| RequireEmailVerification | EMAIL_REQUIRE_EMAIL_VERIFICATION | false |
| FeedbackName | EMAIL_FEEDBACK_NAME | "" |
| FeedbackEmail | EMAIL_FEEDBACK_EMAIL | "" |
| FeedbackOrganization | EMAIL_FEEDBACK_ORGANIZATION | "" |
| SMTPUsername | EMAIL_SMTP_USERNAME | "" |
| SMTPPassword | EMAIL_SMTP_PASSWORD | "" |
| SMTPServer | EMAIL_SMTP_SERVER | "" |
| SMTPPort | EMAIL_SMTP_PORT | "" |
| ConnectionSecurity | EMAIL_CONNECTION_SECURITY | "" |
| InviteSalt | EMAIL_INVITE_SALT | "bjlSR4QqkXFBr7TP4oDzlfZmcNuH9YoS" |
| PasswordResetSalt | EMAIL_PASSWORD_RESET_SALT | "vZ4DcKyVVRlKHHJpexcuXzojkE5PZ5eL" |
| SendPushNotifications | EMAIL_SEND_PUSH_NOTIFICATIONS | false |
| PushNotificationServer | EMAIL_PUSH_NOTIFICATION_SERVER | "" |
| PushNotificationContents | EMAIL_PUSH_NOTIFICATION_CONTENTS | "generic" |

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
| TermsOfServiceLink | SUPPORT_TERMS_OF_SERVICE_LINK | "https://about.mattermost.com/default-terms/" |
| PrivacyPolicyLink | SUPPORT_PRIVACY_POLICY_LINK | "https://about.mattermost.com/default-privacy-policy/" |
| AboutLink | SUPPORT_ABOUT_LINK | "https://about.mattermost.com/default-about/" |
| HelpLink | SUPPORT_HELP_LINK | "https://about.mattermost.com/default-help/" |
| ReportAProblemLink | SUPPORT_REPORT_APROBLEM_LINK | "https://about.mattermost.com/default-report-a-problem/" |
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

### GoogleSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | GOOGLE_ENABLE | false |
| Secret | GOOGLE_SECRET | "" |
| Id | GOOGLE_ID | "" |
| Scope | GOOGLE_SCOPE | "" |
| AuthEndpoint | GOOGLE_AUTH_ENDPOINT | "" |
| TokenEndpoint | GOOGLE_TOKEN_ENDPOINT | "" |
| UserApiEndpoint | GOOGLE_USER_API_ENDPOINT | "" |

### LdapSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | LDAP_ENABLE | false |
| LdapServer | LDAP_LDAP_SERVER | "" |
| LdapPort | LDAP_LDAP_PORT | 389 |
| ConnectionSecurity | LDAP_CONNECTION_SECURITY | "" |
| BaseDN | LDAP_BASE_DN | "" |
| BindUsername | LDAP_BIND_USERNAME | "" |
| BindPassword | LDAP_BIND_PASSWORD | "" |
| UserFilter | LDAP_USER_FILTER | "" |
| FirstNameAttribute | LDAP_FIRST_NAME_ATTRIBUTE | "" |
| LastNameAttribute | LDAP_LAST_NAME_ATTRIBUTE | "" |
| EmailAttribute | LDAP_EMAIL_ATTRIBUTE | "" |
| UsernameAttribute | LDAP_USERNAME_ATTRIBUTE | "" |
| NicknameAttribute | LDAP_NICKNAME_ATTRIBUTE | "" |
| IdAttribute | LDAP_ID_ATTRIBUTE | "" |
| SyncIntervalMinutes | LDAP_SYNC_INTERVAL_MINUTES | 60 |
| SkipCertificateVerification | LDAP_SKIP_CERTIFICATE_VERIFICATION | false |
| QueryTimeout | LDAP_QUERY_TIMEOUT | 60 |
| MaxPageSize | LDAP_MAX_PAGE_SIZE | 0 |
| LoginFieldName | LDAP_LOGIN_FIELD_NAME | "" |

### ComplianceSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | COMPLIANCE_ENABLE | false |
| Directory | COMPLIANCE_DIRECTORY | "./data/" |
| EnableDaily | COMPLIANCE_ENABLE_DAILY | false |

### LocalizationSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| DefaultServerLocale | LOCALIZATION_DEFAULT_SERVER_LOCALE | "en" |
| DefaultClientLocale | LOCALIZATION_DEFAULT_CLIENT_LOCALE | "en" |
| AvailableLocales | LOCALIZATION_AVAILABLE_LOCALES | "" |

### SamlSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | SAML_ENABLE | false |
| Verify | SAML_VERIFY | false |
| Encrypt | SAML_ENCRYPT | false |
| IdpUrl | SAML_IDP_URL | "" |
| IdpDescriptorUrl | SAML_IDP_DESCRIPTOR_URL | "" |
| AssertionConsumerServiceURL | SAML_ASSERTION_CONSUMER_SERVICE_URL | "" |
| IdpCertificateFile | SAML_IDP_CERTIFICATE_FILE | "" |
| PublicCertificateFile | SAML_PUBLIC_CERTIFICATE_FILE | "" |
| PrivateKeyFile | SAML_PRIVATE_KEY_FILE | "" |
| FirstNameAttribute | SAML_FIRST_NAME_ATTRIBUTE | "" |
| LastNameAttribute | SAML_LAST_NAME_ATTRIBUTE | "" |
| EmailAttribute | SAML_EMAIL_ATTRIBUTE | "" |
| UsernameAttribute | SAML_USERNAME_ATTRIBUTE | "" |
| NicknameAttribute | SAML_NICKNAME_ATTRIBUTE | "" |
| LocaleAttribute | SAML_LOCALE_ATTRIBUTE | "" |
| LoginButtonText | SAML_LOGIN_BUTTON_TEXT | "With SAML" |

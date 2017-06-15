# docker-mattermost

docker image for [mattermost](https://github.com/mattermost/platform)

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
| SiteURL | SERVICE_SITE_URL | "http://localhost:8065" |
| LicenseFileLocation | SERVICE_LICENSE_FILE_LOCATION | "" |
| ListenAddress | SERVICE_LISTEN_ADDRESS | ":80" |
| ConnectionSecurity | SERVICE_CONNECTION_SECURITY | "" |
| TLSCertFile | SERVICE_TLSCERT_FILE | "" |
| TLSKeyFile | SERVICE_TLSKEY_FILE | "" |
| UseLetsEncrypt | SERVICE_USE_LETS_ENCRYPT | false |
| LetsEncryptCertificateCacheFile | SERVICE_LETS_ENCRYPT_CERTIFICATE_CACHE_FILE | "./config/letsencrypt.cache" |
| Forward80To443 | SERVICE_FORWARD80_TO443 | false |
| ReadTimeout | SERVICE_READ_TIMEOUT | 300 |
| WriteTimeout | SERVICE_WRITE_TIMEOUT | 300 |
| MaximumLoginAttempts | SERVICE_MAXIMUM_LOGIN_ATTEMPTS | 10 |
| GoroutineHealthThreshold | SERVICE_GOROUTINE_HEALTH_THRESHOLD | -1 |
| GoogleDeveloperKey | SERVICE_GOOGLE_DEVELOPER_KEY | "" |
| EnableOAuthServiceProvider | SERVICE_ENABLE_OAUTH_SERVICE_PROVIDER | false |
| EnableIncomingWebhooks | SERVICE_ENABLE_INCOMING_WEBHOOKS | true |
| EnableOutgoingWebhooks | SERVICE_ENABLE_OUTGOING_WEBHOOKS | true |
| EnableCommands | SERVICE_ENABLE_COMMANDS | true |
| EnableOnlyAdminIntegrations | SERVICE_ENABLE_ONLY_ADMIN_INTEGRATIONS | true |
| EnablePostUsernameOverride | SERVICE_ENABLE_POST_USERNAME_OVERRIDE | false |
| EnablePostIconOverride | SERVICE_ENABLE_POST_ICON_OVERRIDE | false |
| EnableLinkPreviews | SERVICE_ENABLE_LINK_PREVIEWS | false |
| EnableTesting | SERVICE_ENABLE_TESTING | false |
| EnableDeveloper | SERVICE_ENABLE_DEVELOPER | false |
| EnableSecurityFixAlert | SERVICE_ENABLE_SECURITY_FIX_ALERT | true |
| EnableInsecureOutgoingConnections | SERVICE_ENABLE_INSECURE_OUTGOING_CONNECTIONS | false |
| EnableMultifactorAuthentication | SERVICE_ENABLE_MULTIFACTOR_AUTHENTICATION | false |
| EnforceMultifactorAuthentication | SERVICE_ENFORCE_MULTIFACTOR_AUTHENTICATION | false |
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
| RestrictPostDelete | SERVICE_RESTRICT_POST_DELETE | "all" |
| AllowEditPost | SERVICE_ALLOW_EDIT_POST | "always" |
| PostEditTimeLimit | SERVICE_POST_EDIT_TIME_LIMIT | 300 |
| TimeBetweenUserTypingUpdatesMilliseconds | SERVICE_TIME_BETWEEN_USER_TYPING_UPDATES_MILLISECONDS | 5000 |
| EnablePostSearch | SERVICE_ENABLE_POST_SEARCH | true |
| EnableUserTypingMessages | SERVICE_ENABLE_USER_TYPING_MESSAGES | true |
| EnableUserStatuses | SERVICE_ENABLE_USER_STATUSES | true |
| ClusterLogTimeoutMilliseconds | SERVICE_CLUSTER_LOG_TIMEOUT_MILLISECONDS | 2000 |

### ElasticSearchSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| ConnectionUrl | ELASTICSEARCH_CONNECTION_URL | "http://dockerhost:9200" |
| Username | ELASTICSEARCH_USERNAME | "elastic" |
| Password | ELASTICSEARCH_PASSWORD | "changeme" |
| EnableIndexing | ELASTICSEARCH_ENABLE_INDEXING | false |
| EnableSearching | ELASTICSEARCH_ENABLE_SEARCHING | false |
| Sniff | ELASTICSEARCH_SNIFF | true |

### TeamSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| SiteName | TEAM_SITE_NAME | "Mattermost" |
| MaxUsersPerTeam | TEAM_MAX_USERS_PER_TEAM | 50 |
| EnableTeamCreation | TEAM_ENABLE_TEAM_CREATION | true |
| EnableUserCreation | TEAM_ENABLE_USER_CREATION | true |
| EnableOpenServer | TEAM_ENABLE_OPEN_SERVER | false |
| RestrictCreationToDomains | TEAM_RESTRICT_CREATION_TO_DOMAINS | "" |
| EnableCustomBrand | TEAM_ENABLE_CUSTOM_BRAND | false |
| CustomBrandText | TEAM_CUSTOM_BRAND_TEXT | "" |
| CustomDescriptionText | TEAM_CUSTOM_DESCRIPTION_TEXT | "" |
| RestrictDirectMessage | TEAM_RESTRICT_DIRECT_MESSAGE | "any" |
| RestrictTeamInvite | TEAM_RESTRICT_TEAM_INVITE | "all" |
| RestrictPublicChannelManagement | TEAM_RESTRICT_PUBLIC_CHANNEL_MANAGEMENT | "all" |
| RestrictPrivateChannelManagement | TEAM_RESTRICT_PRIVATE_CHANNEL_MANAGEMENT | "all" |
| RestrictPublicChannelCreation | TEAM_RESTRICT_PUBLIC_CHANNEL_CREATION | "all" |
| RestrictPrivateChannelCreation | TEAM_RESTRICT_PRIVATE_CHANNEL_CREATION | "all" |
| RestrictPublicChannelDeletion | TEAM_RESTRICT_PUBLIC_CHANNEL_DELETION | "all" |
| RestrictPrivateChannelDeletion | TEAM_RESTRICT_PRIVATE_CHANNEL_DELETION | "all" |
| RestrictPrivateChannelManageMembers | TEAM_RESTRICT_PRIVATE_CHANNEL_MANAGE_MEMBERS | "all" |
| UserStatusAwayTimeout | TEAM_USER_STATUS_AWAY_TIMEOUT | 300 |
| MaxChannelsPerTeam | TEAM_MAX_CHANNELS_PER_TEAM | 2000 |
| MaxNotificationsPerChannel | TEAM_MAX_NOTIFICATIONS_PER_CHANNEL | 1000 |

### SqlSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| DriverName | SQL_DRIVER_NAME | "mysql" |
| DataSource | SQL_DATA_SOURCE | "mmuser:mostest@tcp(dockerhost:3306)/mattermost_test?charset=utf8mb4,utf8&readTimeout=30s&writeTimeout=30s" |
| DataSourceReplicas | SQL_DATA_SOURCE_REPLICAS | [] |
| DataSourceSearchReplicas | SQL_DATA_SOURCE_SEARCH_REPLICAS | [] |
| MaxIdleConns | SQL_MAX_IDLE_CONNS | 20 |
| MaxOpenConns | SQL_MAX_OPEN_CONNS | 300 |
| Trace | SQL_TRACE | false |
| AtRestEncryptKey | SQL_AT_REST_ENCRYPT_KEY | "" |
| QueryTimeout | SQL_QUERY_TIMEOUT | 30 |

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
| EnableDiagnostics | LOG_ENABLE_DIAGNOSTICS | true |

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
| EnableFileAttachments | FILE_ENABLE_FILE_ATTACHMENTS | true |
| MaxFileSize | FILE_MAX_FILE_SIZE | 52428800 |
| DriverName | FILE_DRIVER_NAME | "local" |
| Directory | FILE_DIRECTORY | "./data/" |
| EnablePublicLink | FILE_ENABLE_PUBLIC_LINK | false |
| PublicLinkSalt | FILE_PUBLIC_LINK_SALT | "" |
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
| AmazonS3Region | FILE_AMAZON_S3_REGION | "us-east-1" |
| AmazonS3Endpoint | FILE_AMAZON_S3_ENDPOINT | "s3.amazonaws.com" |
| AmazonS3SSL | FILE_AMAZON_S3_SSL | true |
| AmazonS3SignV2 | FILE_AMAZON_S3_SIGN_V2 | false |

### EmailSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| EnableSignUpWithEmail | EMAIL_ENABLE_SIGN_UP_WITH_EMAIL | true |
| EnableSignInWithEmail | EMAIL_ENABLE_SIGN_IN_WITH_EMAIL | true |
| EnableSignInWithUsername | EMAIL_ENABLE_SIGN_IN_WITH_USERNAME | true |
| SendEmailNotifications | EMAIL_SEND_EMAIL_NOTIFICATIONS | true |
| RequireEmailVerification | EMAIL_REQUIRE_EMAIL_VERIFICATION | false |
| FeedbackName | EMAIL_FEEDBACK_NAME | "" |
| FeedbackEmail | EMAIL_FEEDBACK_EMAIL | "test@example.com" |
| FeedbackOrganization | EMAIL_FEEDBACK_ORGANIZATION | "" |
| SMTPUsername | EMAIL_SMTP_USERNAME | "" |
| SMTPPassword | EMAIL_SMTP_PASSWORD | "" |
| SMTPServer | EMAIL_SMTP_SERVER | "dockerhost" |
| SMTPPort | EMAIL_SMTP_PORT | "2500" |
| ConnectionSecurity | EMAIL_CONNECTION_SECURITY | "" |
| InviteSalt | EMAIL_INVITE_SALT | "" |
| SendPushNotifications | EMAIL_SEND_PUSH_NOTIFICATIONS | false |
| PushNotificationServer | EMAIL_PUSH_NOTIFICATION_SERVER | "" |
| PushNotificationContents | EMAIL_PUSH_NOTIFICATION_CONTENTS | "generic" |
| EnableEmailBatching | EMAIL_ENABLE_EMAIL_BATCHING | false |
| EmailBatchingBufferSize | EMAIL_EMAIL_BATCHING_BUFFER_SIZE | 256 |
| EmailBatchingInterval | EMAIL_EMAIL_BATCHING_INTERVAL | 30 |
| SkipServerCertificateVerification | EMAIL_SKIP_SERVER_CERTIFICATE_VERIFICATION | false |

### RateLimitSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | RATELIMIT_ENABLE | false |
| PerSec | RATELIMIT_PER_SEC | 10 |
| MaxBurst | RATELIMIT_MAX_BURST | 100 |
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

### AnnouncementSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| EnableBanner | ANNOUNCEMENT_ENABLE_BANNER | false |
| BannerText | ANNOUNCEMENT_BANNER_TEXT | "" |
| BannerColor | ANNOUNCEMENT_BANNER_COLOR | "#f2a93b" |
| BannerTextColor | ANNOUNCEMENT_BANNER_TEXT_COLOR | "#333333" |
| AllowBannerDismissal | ANNOUNCEMENT_ALLOW_BANNER_DISMISSAL | true |

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
| Scope | GOOGLE_SCOPE | "profile email" |
| AuthEndpoint | GOOGLE_AUTH_ENDPOINT | "https://accounts.google.com/o/oauth2/v2/auth" |
| TokenEndpoint | GOOGLE_TOKEN_ENDPOINT | "https://www.googleapis.com/oauth2/v4/token" |
| UserApiEndpoint | GOOGLE_USER_API_ENDPOINT | "https://www.googleapis.com/plus/v1/people/me" |

### Office365Settings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | OFFICE365_ENABLE | false |
| Secret | OFFICE365_SECRET | "" |
| Id | OFFICE365_ID | "" |
| Scope | OFFICE365_SCOPE | "User.Read" |
| AuthEndpoint | OFFICE365_AUTH_ENDPOINT | "https://login.microsoftonline.com/common/oauth2/v2.0/authorize" |
| TokenEndpoint | OFFICE365_TOKEN_ENDPOINT | "https://login.microsoftonline.com/common/oauth2/v2.0/token" |
| UserApiEndpoint | OFFICE365_USER_API_ENDPOINT | "https://graph.microsoft.com/v1.0/me" |

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
| PositionAttribute | LDAP_POSITION_ATTRIBUTE | "" |
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
| Verify | SAML_VERIFY | true |
| Encrypt | SAML_ENCRYPT | true |
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
| PositionAttribute | SAML_POSITION_ATTRIBUTE | "" |
| LoginButtonText | SAML_LOGIN_BUTTON_TEXT | "With SAML" |

### NativeAppSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| AppDownloadLink | NATIVEAPP_APP_DOWNLOAD_LINK | "https://about.mattermost.com/downloads/" |
| AndroidAppDownloadLink | NATIVEAPP_ANDROID_APP_DOWNLOAD_LINK | "https://about.mattermost.com/mattermost-android-app/" |
| IosAppDownloadLink | NATIVEAPP_IOS_APP_DOWNLOAD_LINK | "https://about.mattermost.com/mattermost-ios-app/" |

### ClusterSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | CLUSTER_ENABLE | false |
| InterNodeListenAddress | CLUSTER_INTER_NODE_LISTEN_ADDRESS | ":8075" |
| InterNodeUrls | CLUSTER_INTER_NODE_URLS | [] |

### MetricsSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | METRICS_ENABLE | false |
| BlockProfileRate | METRICS_BLOCK_PROFILE_RATE | 0 |
| ListenAddress | METRICS_LISTEN_ADDRESS | ":8067" |

### AnalyticsSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| MaxUsersForStatistics | ANALYTICS_MAX_USERS_FOR_STATISTICS | 2500 |

### WebrtcSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | WEBRTC_ENABLE | false |
| GatewayWebsocketUrl | WEBRTC_GATEWAY_WEBSOCKET_URL | "" |
| GatewayAdminUrl | WEBRTC_GATEWAY_ADMIN_URL | "" |
| GatewayAdminSecret | WEBRTC_GATEWAY_ADMIN_SECRET | "" |
| StunURI | WEBRTC_STUN_URI | "" |
| TurnURI | WEBRTC_TURN_URI | "" |
| TurnUsername | WEBRTC_TURN_USERNAME | "" |
| TurnSharedKey | WEBRTC_TURN_SHARED_KEY | "" |

### DataRetentionSettings

| configuration name | env | default |
| :--- | :--- | :--- |
| Enable | DATARETENTION_ENABLE | false |

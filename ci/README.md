# CI Credentials (Azure Example)

For Azure, you can store a single secret `AZURE_CREDENTIALS` with this JSON (Service Principal):

```json
{
  "clientId": "<APP_ID>",
  "clientSecret": "<PASSWORD>",
  "tenantId": "<TENANT_ID>",
  "subscriptionId": "<SUB_ID>"
}
```

Or provide classic `ARM_*` env vars:
- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_TENANT_ID`
- `ARM_SUBSCRIPTION_ID`

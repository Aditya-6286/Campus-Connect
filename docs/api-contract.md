# Initial API Contract

## Health

**GET** `/api/health`

Returns a lightweight service health response.

### Success response

```json
{
  "status": "ok",
  "service": "campus-connect",
  "timestamp": "ISO-8601 timestamp"
}
```

## Error format

Unknown routes return:

```json
{
  "error": "Not Found",
  "message": "The requested route does not exist."
}
```

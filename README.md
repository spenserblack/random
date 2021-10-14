# Random Response

Get a random value from an HTTP request.

The purpose of this is to get a random value when you cannot use
"code" in the traditional sense. For example, if you wanted to create
a dynamic badge to be displayed in Markdown, without using a scheduled action
and/or committing changes to the badge URL.

## Usage

Hit the [`/api` endpoint](http://random-nu-five.vercel.app/api) to get a random float between
`0` and `1`.

If you set the `Accept` header to `application/json`, then the response will be in the format
```json
{"value":0.123}
```

You can use an optional `min` and `max` value in the query parameters. This will cause the
value in the response to be a *integer between `min` and `max`* instead of a float. `max`
can be used without `min`, but `min` *must have a `max` value*.

## Example

### Randomized Badge

```markdown
![roll](https://img.shields.io/badge/dynamic/json?color=informational&label=dice%20roll&query=value&url=http%3A%2F%2Frandom-nu-five.vercel.app%2Fapi%3Fmin%3D1%26max%3D6)
```
![roll](https://img.shields.io/badge/dynamic/json?color=informational&label=dice%20roll&query=value&url=http%3A%2F%2Frandom-nu-five.vercel.app%2Fapi%3Fmin%3D1%26max%3D6)

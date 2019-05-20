ports=(
  -L 6410:localhost:6410  # consumer-api
  -L 6411:localhost:6411  # consumer-web
  -L 5433:localhost:5432  # postgres
)

ssh "${ports[@]}" jordan@miskatonic.spiralpower.net -p 42


# Datos crudos (CSV desde NotebookLM)

Este directorio contiene los CSV exportados desde NotebookLM Data Tables.
Cada archivo tiene una fila por entidad.

## Archivos esperados

| Archivo | Columnas |
|---------|----------|
| `casas.csv` | `nombre`, `region`, `lema`, `asiento`, `colores`, `descripcion` |
| `personajes.csv` | `nombre`, `alias`, `casa`, `cultura`, `estado`, `nacimiento`, `muerte`, `padre`, `madre`, `conyuges`, `hijos`, `hermanos`, `descripcion` |
| `lugares.csv` | `nombre`, `region`, `descripcion` |
| `eventos.csv` | `titulo`, `anio`, `lugar`, `personajes_involucrados`, `descripcion` |

## Reglas

- Separador de CSV: coma (`,`)
- Campos con múltiples valores: punto y coma (`;`) como separador interno
- Si un dato no aparece en las fuentes: `Desconocido` o `Ninguno`
- Los nombres deben ser consistentes entre tablas para poder cruzarlos

## Uso

```bash
# Ejecutar el loader contra Supabase
npx tsx scripts/load-data.ts
```

Requiere variables de entorno:
- `SUPABASE_URL` (o `VITE_SUPABASE_URL`)
- `SUPABASE_SERVICE_ROLE_KEY` (NUNCA la anon key)

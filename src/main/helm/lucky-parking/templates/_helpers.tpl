{{- define "application.labels" -}}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: helm
app.kubernetes.io/created-by: helm
{{- end }}

{{- define "container.labels" -}}
app.kubernetes.io/name: backend
app.kubernetes.io/component: container
{{- end }}

{{- define "backend.service.name" -}}
backend-service
{{- end }}

{{- define "backend.service.port" -}}
http
{{- end }}

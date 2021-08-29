{{- define "application.labels" -}}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: helm
app.kubernetes.io/created-by: helm
{{- end }}

{{- define "backend.container.labels" -}}
app.kubernetes.io/name: backend
app.kubernetes.io/component: container
{{- end }}

{{- define "backend.service.name" -}}
backend-service
{{- end }}

{{- define "backend.service.port" -}}
http
{{- end }}

{{- define "keycloak.container.labels" -}}
app.kubernetes.io/name: keycloak
app.kubernetes.io/component: container
{{- end }}

{{- define "keycloak.service.name" -}}
keycloak-service
{{- end }}

{{- define "keycloak.service.port" -}}
http
{{- end }}

{{- define "host" -}}
{{ .Values.subdomain }}.{{ .Values.domain }}
{{- end }}
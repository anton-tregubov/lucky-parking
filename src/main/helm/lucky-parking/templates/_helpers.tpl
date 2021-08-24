{{- define "application.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: helm
app.kubernetes.io/created-by: helm
{{- end }}

{{- define "domain" -}}
    {{(.Values.domain) | default "kubernetes.docker.internal"}}
{{- end -}}

{{- define "backend.service.name" -}}
backend-service
{{- end }}

{{- define "backend.service.port" -}}
http
{{- end }}

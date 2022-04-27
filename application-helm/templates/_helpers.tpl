{{/* vim: set filetype=mustache: */}}
{{/*
Define the name of the chart/application.
*/}}

{{- define "application.name" -}}
{{- default .Chart.Name .Values.applicationName | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "application.labels.selector" -}}
app.kubernetes.io/name: {{ template "application.name" . }}
app.kubernetes.io/instance: {{ template "application.name" . }}
{{- end -}}

{{- define "application.labels" -}}
{{ template "application.labels.selector" . }}
{{- end -}}

{{- define "application.labels.chart" -}}
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
helm.sh/release: {{ .Release.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}

{{- define "helpers.list-service-ports" -}}
{{- range $ports := .Values.service.ports -}}
    {{- range $name, $port := $ports }}
- name: {{ $name }}
  port: {{ $port }}
  protocol: TCP
    {{- end }}
{{- end}}
{{- end}}

{{- define "helpers.list-deployment-ports" -}}
{{- range $ports := .Values.service.ports -}}
  {{- range $name, $port := $ports }}
- name: {{ $name }}
  containerPort: {{ $port }}
  protocol: TCP
  {{- end }}
{{- end -}}
{{- end -}}


{{- define "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.labels" -}}
helm.sh/chart: {{ include "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.chart" . }}
{{ include "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1c2c2360-c94e-4166-8a85-2666e440fa8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.fullname" -}}
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


{{- define "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.labels" -}}
helm.sh/chart: {{ include "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.chart" . }}
{{ include "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76cb2cb9-9c71-4032-a28d-62f94cbd9020.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
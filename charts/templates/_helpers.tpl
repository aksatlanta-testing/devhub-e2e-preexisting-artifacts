
{{- define "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.fullname" -}}
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


{{- define "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.labels" -}}
helm.sh/chart: {{ include "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.chart" . }}
{{ include "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0aa7674e-816a-4920-9a53-25df0fe5e67c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
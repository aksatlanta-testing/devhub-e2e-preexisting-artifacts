
{{- define "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.fullname" -}}
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


{{- define "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.labels" -}}
helm.sh/chart: {{ include "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.chart" . }}
{{ include "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5e3cfbfa-75ea-4876-80ea-aafbba76d929.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
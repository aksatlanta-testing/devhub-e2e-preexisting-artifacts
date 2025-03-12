
{{- define "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.fullname" -}}
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


{{- define "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.labels" -}}
helm.sh/chart: {{ include "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.chart" . }}
{{ include "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3c37eb4-ddf7-4ef6-a949-b73e608422ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
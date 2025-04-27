
{{- define "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.fullname" -}}
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


{{- define "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.labels" -}}
helm.sh/chart: {{ include "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.chart" . }}
{{ include "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa51752cc-aa33-4782-a562-4f1eb7dc0eef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
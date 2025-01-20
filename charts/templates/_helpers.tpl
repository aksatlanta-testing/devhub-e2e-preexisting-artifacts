
{{- define "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.fullname" -}}
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


{{- define "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.labels" -}}
helm.sh/chart: {{ include "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.chart" . }}
{{ include "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad567de7-7d39-47be-b4ff-ed82113d1635.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
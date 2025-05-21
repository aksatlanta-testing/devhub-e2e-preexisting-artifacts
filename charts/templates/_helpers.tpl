
{{- define "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.fullname" -}}
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


{{- define "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.labels" -}}
helm.sh/chart: {{ include "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.chart" . }}
{{ include "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1eab9ed-ff42-4bf9-a013-83c3e4115e97.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.fullname" -}}
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


{{- define "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.labels" -}}
helm.sh/chart: {{ include "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.chart" . }}
{{ include "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeeadda15-c86f-47a3-a1bb-edab365bf727.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
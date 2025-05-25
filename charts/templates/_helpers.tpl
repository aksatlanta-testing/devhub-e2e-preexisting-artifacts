
{{- define "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.fullname" -}}
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


{{- define "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.labels" -}}
helm.sh/chart: {{ include "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.chart" . }}
{{ include "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaea8e22a-86ee-40f8-b192-d00761d0e027.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
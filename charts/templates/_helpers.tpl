
{{- define "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.fullname" -}}
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


{{- define "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.labels" -}}
helm.sh/chart: {{ include "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.chart" . }}
{{ include "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5b6904eb-760b-4392-84d9-9877c889fceb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
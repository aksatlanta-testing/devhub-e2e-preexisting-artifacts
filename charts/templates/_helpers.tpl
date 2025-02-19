
{{- define "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.fullname" -}}
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


{{- define "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.labels" -}}
helm.sh/chart: {{ include "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.chart" . }}
{{ include "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo209fc18a-33be-4e2c-97c3-2701d6fd6231.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo35326106-d017-4b84-b180-c1a962430305.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo35326106-d017-4b84-b180-c1a962430305.fullname" -}}
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


{{- define "go-echo35326106-d017-4b84-b180-c1a962430305.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo35326106-d017-4b84-b180-c1a962430305.labels" -}}
helm.sh/chart: {{ include "go-echo35326106-d017-4b84-b180-c1a962430305.chart" . }}
{{ include "go-echo35326106-d017-4b84-b180-c1a962430305.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo35326106-d017-4b84-b180-c1a962430305.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo35326106-d017-4b84-b180-c1a962430305.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
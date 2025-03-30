
{{- define "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.fullname" -}}
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


{{- define "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.labels" -}}
helm.sh/chart: {{ include "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.chart" . }}
{{ include "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocddf97ce-5bc2-495f-8a01-01b0f8576441.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
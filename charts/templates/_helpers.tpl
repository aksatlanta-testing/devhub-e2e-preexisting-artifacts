
{{- define "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.fullname" -}}
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


{{- define "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.labels" -}}
helm.sh/chart: {{ include "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.chart" . }}
{{ include "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo87119e0a-b2bc-491e-a826-a9ef375b9eec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
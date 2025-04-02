
{{- define "go-echo59d71e03-477f-4169-af1d-93e58f82760b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59d71e03-477f-4169-af1d-93e58f82760b.fullname" -}}
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


{{- define "go-echo59d71e03-477f-4169-af1d-93e58f82760b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59d71e03-477f-4169-af1d-93e58f82760b.labels" -}}
helm.sh/chart: {{ include "go-echo59d71e03-477f-4169-af1d-93e58f82760b.chart" . }}
{{ include "go-echo59d71e03-477f-4169-af1d-93e58f82760b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo59d71e03-477f-4169-af1d-93e58f82760b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo59d71e03-477f-4169-af1d-93e58f82760b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
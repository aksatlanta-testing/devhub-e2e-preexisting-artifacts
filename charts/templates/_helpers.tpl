
{{- define "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.fullname" -}}
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


{{- define "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.labels" -}}
helm.sh/chart: {{ include "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.chart" . }}
{{ include "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo29be6aa8-1c84-4955-bd8c-0f4fb1e7996b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
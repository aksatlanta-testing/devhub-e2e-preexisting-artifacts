
{{- define "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.fullname" -}}
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


{{- define "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.labels" -}}
helm.sh/chart: {{ include "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.chart" . }}
{{ include "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo45501c0f-cb4a-4c88-b8f3-d472fe3a19fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
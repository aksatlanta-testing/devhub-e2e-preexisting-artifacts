
{{- define "go-echoddf742f8-3291-46a2-afaa-b471891fb507.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddf742f8-3291-46a2-afaa-b471891fb507.fullname" -}}
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


{{- define "go-echoddf742f8-3291-46a2-afaa-b471891fb507.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddf742f8-3291-46a2-afaa-b471891fb507.labels" -}}
helm.sh/chart: {{ include "go-echoddf742f8-3291-46a2-afaa-b471891fb507.chart" . }}
{{ include "go-echoddf742f8-3291-46a2-afaa-b471891fb507.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoddf742f8-3291-46a2-afaa-b471891fb507.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoddf742f8-3291-46a2-afaa-b471891fb507.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
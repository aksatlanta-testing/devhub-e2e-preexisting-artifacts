
{{- define "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.fullname" -}}
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


{{- define "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.labels" -}}
helm.sh/chart: {{ include "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.chart" . }}
{{ include "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof0275737-0c37-4df0-9ea9-c2f5753b6257.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
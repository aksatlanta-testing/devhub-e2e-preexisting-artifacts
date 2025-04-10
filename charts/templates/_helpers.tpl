
{{- define "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.fullname" -}}
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


{{- define "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.labels" -}}
helm.sh/chart: {{ include "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.chart" . }}
{{ include "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5a44e81-ab8e-47d1-9a5b-2e6f0e0364db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
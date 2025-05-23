
{{- define "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.fullname" -}}
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


{{- define "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.labels" -}}
helm.sh/chart: {{ include "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.chart" . }}
{{ include "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5d33bbe-665e-41b9-8218-e9efdf7d95aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.fullname" -}}
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


{{- define "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.labels" -}}
helm.sh/chart: {{ include "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.chart" . }}
{{ include "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4c1c939-e4a9-4af2-b918-4e2d690967ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.fullname" -}}
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


{{- define "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.labels" -}}
helm.sh/chart: {{ include "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.chart" . }}
{{ include "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3701131-e8ec-4ec0-be66-06a2fc037529.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.fullname" -}}
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


{{- define "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.labels" -}}
helm.sh/chart: {{ include "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.chart" . }}
{{ include "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2911193-b415-4b6d-aa34-125c2eb7aae8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
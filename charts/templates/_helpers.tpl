
{{- define "go-echod10aed8e-33c5-4455-8c6d-852d26838079.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod10aed8e-33c5-4455-8c6d-852d26838079.fullname" -}}
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


{{- define "go-echod10aed8e-33c5-4455-8c6d-852d26838079.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod10aed8e-33c5-4455-8c6d-852d26838079.labels" -}}
helm.sh/chart: {{ include "go-echod10aed8e-33c5-4455-8c6d-852d26838079.chart" . }}
{{ include "go-echod10aed8e-33c5-4455-8c6d-852d26838079.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod10aed8e-33c5-4455-8c6d-852d26838079.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod10aed8e-33c5-4455-8c6d-852d26838079.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
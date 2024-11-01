
{{- define "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.fullname" -}}
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


{{- define "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.labels" -}}
helm.sh/chart: {{ include "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.chart" . }}
{{ include "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob283dc3c-1769-4f28-be1e-cb49407f58c0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
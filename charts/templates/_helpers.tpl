
{{- define "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.fullname" -}}
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


{{- define "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.labels" -}}
helm.sh/chart: {{ include "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.chart" . }}
{{ include "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3388d31-26c0-405e-9c1e-7cb5d8842350.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
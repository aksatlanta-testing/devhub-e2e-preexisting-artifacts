
{{- define "go-echob3e46b3a-571b-462d-b84e-177602a82e39.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3e46b3a-571b-462d-b84e-177602a82e39.fullname" -}}
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


{{- define "go-echob3e46b3a-571b-462d-b84e-177602a82e39.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3e46b3a-571b-462d-b84e-177602a82e39.labels" -}}
helm.sh/chart: {{ include "go-echob3e46b3a-571b-462d-b84e-177602a82e39.chart" . }}
{{ include "go-echob3e46b3a-571b-462d-b84e-177602a82e39.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3e46b3a-571b-462d-b84e-177602a82e39.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3e46b3a-571b-462d-b84e-177602a82e39.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
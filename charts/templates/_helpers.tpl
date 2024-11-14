
{{- define "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.fullname" -}}
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


{{- define "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.labels" -}}
helm.sh/chart: {{ include "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.chart" . }}
{{ include "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2e2055f9-0d93-4992-91b2-2da8c64e6b0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
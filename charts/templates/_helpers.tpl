
{{- define "go-echo739b976b-c805-4471-9f89-403a2e1c9958.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo739b976b-c805-4471-9f89-403a2e1c9958.fullname" -}}
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


{{- define "go-echo739b976b-c805-4471-9f89-403a2e1c9958.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo739b976b-c805-4471-9f89-403a2e1c9958.labels" -}}
helm.sh/chart: {{ include "go-echo739b976b-c805-4471-9f89-403a2e1c9958.chart" . }}
{{ include "go-echo739b976b-c805-4471-9f89-403a2e1c9958.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo739b976b-c805-4471-9f89-403a2e1c9958.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo739b976b-c805-4471-9f89-403a2e1c9958.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
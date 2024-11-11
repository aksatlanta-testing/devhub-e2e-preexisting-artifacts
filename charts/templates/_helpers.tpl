
{{- define "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.fullname" -}}
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


{{- define "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.labels" -}}
helm.sh/chart: {{ include "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.chart" . }}
{{ include "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7cd577a1-edf4-4dfe-875d-4fbe3610fbfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
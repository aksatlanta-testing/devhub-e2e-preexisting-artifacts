
{{- define "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.fullname" -}}
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


{{- define "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.labels" -}}
helm.sh/chart: {{ include "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.chart" . }}
{{ include "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0df8d0f9-50a4-446e-a557-e12ed801a791.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
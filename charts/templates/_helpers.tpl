
{{- define "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.fullname" -}}
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


{{- define "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.labels" -}}
helm.sh/chart: {{ include "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.chart" . }}
{{ include "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo999f8f0c-2d53-41ac-8302-8839aecefe3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}